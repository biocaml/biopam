# -*- mode: python -*-
import sys
block_cipher = None
a = Analysis(['OptiTypePipeline.py'],
             pathex=['.'],
             binaries=None,
             datas=[('data','data')],
             hiddenimports=['tables', 'six', 'packaging', 'packaging.requirements', 'packaging.version', 'packaging.specifiers'],
             hookspath=['.'],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher)

# Pyinstaller will silently ignore missing dependencies. To avoid having the
# install script succeed, while the result won't run, we check for the required
# packages here.
packages = map(lambda x: x[0], a.pure)

def check_package(module_name):
  #seems to be the canonical way of finding elements in a list via Python2
  if filter(lambda x: x.startswith(module_name), packages) == []:
    print "Missing " + module_name + " package!"
    sys.exit(-1)

check_package("numpy")
check_package("tables")
check_package("pyomo")
check_package("pandas")
check_package("pysam")
check_package("matplotlib")

check_package("six")
check_package("packaging")
check_package("packaging.requirements")
check_package("packaging.version")
check_package("packaging.specifiers")

pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)
exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          name='OptiTypePipeline',
          debug=False,
          strip=False,
          upx=True,
          console=True )
