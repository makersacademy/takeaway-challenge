from distutils.core import setup
setup(
  name = 'bm_takeaway_makers',
  packages = ['bm_takeaway_makers'],
  version = '0.4',
  license='MIT',
  description = 'takeaway-challenge',
  author = 'Ben Margerison',
  author_email = 'bmargerison@outlook.com',
  url = 'https://github.com/bmargerison/takeaway-challenge',
  download_url = 'https://github.com/bmargerison/takeaway-challenge/archive/refs/tags/v0.4.tar.gz',
  keywords = ['takeaway', 'order', 'text'],
  install_requires=[
          'twilio',
          'pytest'
      ],
  classifiers=[
    'Development Status :: 5 - Production/Stable',      
    'Intended Audience :: Developers',
    'Topic :: Software Development :: Build Tools',
    'License :: OSI Approved :: MIT License',
    'Programming Language :: Python :: 3.8',
  ],
)