# Initial submission

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

## Resubmission 1

"Using foo:::f instead of foo::f allows access to unexported objects.
This is generally not recommended, as the semantics of unexported
objects may be changed by the package author in routine maintenance."

I have now modified the examples for all internal functions to avoid this 
practice.

Thanks for the speedy review!

## Resubmission 2

"You have examples for unexported functions. Please either omit these
examples or export these functions."

I have now omitted the examples for all internal functions and have 
removed /man pages with #' @noRd. I will make the examples available in
the development version for those who wish to access them after 
acceptance by CRAN.

Thanks again for the speedy review!

## Resubmission 3

"You write information messages to the console that cannot be easily suppressed. 
It is more R like to generate objects that can be used to extract the 
information a user is interested in, and then print() that object.
Instead of print()/cat() rather use message()/warning()  or if(verbose)cat(..) 
(or maybe stop()) if you really have to write text to the console.
(except for print, summary, interactive functions)"

I have modified the `summariseR` function to return an object.

PLEASE NOTE: `interpretR()` is a print function, and modifying it to not print
would remove its functionality.

Thanks for the feedback!

# Update 1. v1.0.2

## R CMD check results

0 errors | 0 warnings | 0 notes

## Check for CRAN results

For a CRAN submission we recommend that you fix all NOTEs, WARNINGs and ERRORs.

### Test environments
- R-hub windows-x86_64-devel (r-devel)
- R-hub ubuntu-gcc-release (r-release)
- R-hub fedora-clang-devel (r-devel)

### R CMD check results
❯ On windows-x86_64-devel (r-devel)
  checking for non-standard things in the check directory ... NOTE
  
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

❯ On ubuntu-gcc-release (r-release), fedora-clang-devel (r-devel)
  checking HTML version of manual ... NOTE
  Skipping checking HTML validation: no command 'tidy' found
  
  I cannot do anything about the fact that tidy is not on the Path on the 
  external Fedora Linux server. Ignoring this note. 

0 errors ✔ | 0 warnings ✔ | 3 notes ✖

# Update 2. v1.0.3

── R CMD check results ─────────────────────────────────────────────────────────
── testCompareR 1.0.3  ─────────────────────────────────────────────────────────
Duration: 51.2s

0 errors ✔ | 0 warnings ✔ | 0 notes ✔

Checks run using rhub v2. 
See https://github.com/Kajlinko/testCompareR/actions for output.

# Update 3. v1.0.4

── R CMD check results ─────────────────────────────────────────────────────────
── testCompareR 1.0.4  ─────────────────────────────────────────────────────────
Duration: 51.2s

0 errors ✔ | 0 warnings ✔ | 0 notes ✔

Checks run using rhub v2. 
See https://github.com/Kajlinko/testCompareR/actions for output.

# Update 4. v1.1.0

── R CMD check results ─────────────────────────────────────────────────────────
── testCompareR 1.1.0  ─────────────────────────────────────────────────────────
Duration: 51.2s

0 errors ✔ | 0 warnings ✔ | 0 notes ✔

Checks run using rhub v2. 
See https://github.com/Kajlinko/testCompareR/actions for output.

# Update 5. v1.1.1

── R CMD check results ─────────────────────────────────────────────────────────
── testCompareR 1.1.1  ─────────────────────────────────────────────────────────
Duration: 10.8s

0 errors ✔ | 0 warnings ✔ | 0 notes ✔

Checks run using rhub v2. 
See https://github.com/Kajlinko/testCompareR/actions for output.
