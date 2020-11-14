#/bin/bash
# @ https://code.funtoo.org/bitbucket/rest/api/latest/projects/~DROBBINS/repos/fchroot/archive?format=zip / #tar.gz / else zip is defacto


fetch_fchroot() {
  git clone https://code.funtoo.org/bitbucket/scm/~drobbins/fchroot.git /usr/src/fchroot/ &&  python3 setup.py install
}
