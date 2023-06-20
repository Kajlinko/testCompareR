## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.

## Check for CRAN results

For a CRAN submission we recommend that you fix all NOTEs, WARNINGs and ERRORs.

### Test environments
- R-hub windows-x86_64-devel (r-devel)
- R-hub ubuntu-gcc-release (r-release)
- R-hub fedora-clang-devel (r-devel)

### R CMD check results
❯ On windows-x86_64-devel (r-devel)
  checking CRAN incoming feasibility ... NOTE
  Maintainer: 'Kyle J. Wilson <kyle.jordan.wilson@googlemail.com>'
  
  New submission
  
  Possibly misspelled words in DESCRIPTION:
    Nofuentes (13:203)
    
  The name Roldán-Nofuentes is correctly spelled. I have cross-referenced 
  academic articles and the website for Unversidad de Granada.
    

❯ On windows-x86_64-devel (r-devel)
  checking for non-standard things in the check directory ... NOTE
  Found the following files/directories:
    ''NULL''
    
  Other users have experienced this note. I have comprehensively checked the 
  temporary folders and I have been unable to find this file or directory.
  The issue has previously been logged with `rhub` on
  [Github](https://github.com/r-hub/rhub/issues/560). Advice is to ignore.

❯ On windows-x86_64-devel (r-devel)
  checking for detritus in the temp directory ... NOTE
  Found the following files/directories:
    'lastMiKTeXException'
    
  Other users have experienced this note. I have comprehensively checked the 
  temporary folders and I have been unable to find this file or directory.
  The issue has previously been logged with `rhub` on
  [Github](https://github.com/r-hub/rhub/issues/503). Advice is to ignore.

❯ On ubuntu-gcc-release (r-release)
  checking CRAN incoming feasibility ... [5s/12s] NOTE
  Maintainer: ‘Kyle J. Wilson <kyle.jordan.wilson@googlemail.com>’
  
  New submission
  
  Possibly misspelled words in DESCRIPTION:
    Nofuentes (13:202)
    Roldán (13:195)
    
  The name Roldán-Nofuentes is correctly spelled. I have cross-referenced 
  academic articles and the website for Unversidad de Granada.

❯ On ubuntu-gcc-release (r-release), fedora-clang-devel (r-devel)
  checking HTML version of manual ... NOTE
  Skipping checking HTML validation: no command 'tidy' found
  
  I cannot do anything about the fact that tidy is not on the Path on the 
  external Fedora Linux server. Ignoring this note. 

❯ On fedora-clang-devel (r-devel)
  checking CRAN incoming feasibility ... [6s/12s] NOTE
  Maintainer: ‘Kyle J. Wilson <kyle.jordan.wilson@googlemail.com>’
  
  New submission
  
  Possibly misspelled words in DESCRIPTION:
    Nofuentes (13:202)
    Roldán (13:195)
    
  The name Roldán-Nofuentes is correctly spelled. I have cross-referenced 
  academic articles and the website for Unversidad de Granada.

0 errors ✔ | 0 warnings ✔ | 6 notes ✖

## Resubmission

"Using foo:::f instead of foo::f allows access to unexported objects.
This is generally not recommended, as the semantics of unexported
objects may be changed by the package author in routine maintenance."

I have now modified the examples for all internal functions to avoid this 
practice.

Thanks for the speedy review!
