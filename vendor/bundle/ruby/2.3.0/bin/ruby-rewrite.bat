@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
@"C:\RailsInstaller\Ruby2.3.3\bin\ruby.exe" "C:/Users/Elly/Desktop/Project/takeaway-challenge/vendor/bundle/ruby/2.3.0/bin/ruby-rewrite" %1 %2 %3 %4 %5 %6 %7 %8 %9
GOTO :EOF
:WinNT
@"C:\RailsInstaller\Ruby2.3.3\bin\ruby.exe" "%~dpn0" %*
