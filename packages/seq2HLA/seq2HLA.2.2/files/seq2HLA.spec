# -*- mode: python -*-
import sys
block_cipher = None
a = Analysis(['seq2HLA.py'],
             pathex=['.'],
             binaries=None,
             datas=[('*.R', '.')
                   ,('*.dbmhc', '.')
                   ,('references','references')
                   ],
             hiddenimports=['Bio'],
             hookspath=[],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher)
# Check to make sure that Biopython is actaully in the system!
if filter(lambda x: x[0].startswith('Bio'), a.pure) == []:
  print "Missing Biopython package!"
  sys.exit(-1)

pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)
exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          name='seq2HLA',
          debug=False,
          strip=False,
          upx=True,
          console=True )
