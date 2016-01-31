#!/bin/bash
  echo 'Pushing details to Tracker'
  # Notifies a webhook on attempted "git push".  Called by "git
  # push" after it has checked the remote status, but before anything has been
  # pushed.  If this script exits with a non-zero status nothing will be pushed.
  #
  # This hook is called with the following parameters:
  #
  # $1 -- Name of the remote to which the push is being done
  # $2 -- URL to which the push is being done
  #
  # If pushing without using a named remote those arguments will be equal.
  #
  # Information about the commits which are being pushed is supplied as lines to
  # the standard input in the form:
  #
  #   <local ref> <local sha1> <remote ref> <remote sha1>
  #

  # Utility functions
  # Webhook-posting function

  function posthook {
    curl "git-receiver.herokuapp.com/commits" \
    -X POST \
    -H "Content-type: application/json" \
    -d '"{\"email\": \""$1"\", \"commits\": ["$2"], \"remote_url\": \""$3"\"}"'
  }

  # Join function in the style of Pascal Pilz

  function join { local IFS="$1"; shift; echo "$*"; }
  
  remote="$1"
  url="$2"

  z40=0000000000000000000000000000000000000000

  IFS=' '
  while read local_ref local_sha remote_ref remote_sha
  do
    if [ "$local_sha" = $z40 ]
    then
      # Handle delete
      echo 'Local SHA is $z40'
                  :
    else
      if [ "$remote_sha" = $z40 ]
      then
        # New branch, examine all commits
        range="$local_sha"
      else
        # Update to existing branch, examine new commits
        range="$remote_sha..$local_sha"
      fi
  
      # Get all commits in the relevant range
      commits=`git rev-list "$range"`
      commits_array=()
      if [ -n "$commits" ]
      then
        # Construct an array of the commit SHAs
        while read -r line; do
          commits_array+=(\""$line"\")
        done <<< "$commits"
        # Construct the joined string for JSON
        commits_string=`join , "${commits_array[@]}"`
        email=`git config user.email`
        # Post the commits to the webhook along with the user
        posthook "$email" "$commits_string" "$url"
        exit 0
      else
        echo "Commit is empty"
      fi
    fi
  done

  exit 0