# Will update later.

# Warning: Don't acually use this, use Group Policy. As Group Policy has advantages like actual policy applying and not just registry keys.
# It'll also break your system due to a lack of Registry.pol
# This is just to give you an idea of where example Group Policy registry keys are stored.

## AES-256 disk encryption.
Location: HKLM\SOFTWARE\Policies\Microsoft\FVE EncryptionMethodWithXtsFdv  REG_DWORD 7

Location: HKLM\SOFTWARE\Policies\Microsoft\FVE EncryptionMethodWithXtsOs  REG_DWORD 7

Location: HKLM\SOFTWARE\Policies\Microsoft\FVE EncryptionMethodWithXtsRdv  REG_DWORD 7


## TPM (disk encryption for localdisk).
Location: HKLM\SOFTWARE\Policies\Microsoft\FVE EnableBDEWithNoTPM REG_DWORD 1

Location: HKLM\SOFTWARE\Policies\Microsoft\FVE UseAdvancedStartup REG_DWORD 1

Location: HKLM\SOFTWARE\Policies\Microsoft\FVE UseTPM REG_DWORD 2

Location: HKLM\SOFTWARE\Policies\Microsoft\FVE UseTPMKey REG_DWORD 2

Location: HKLM\SOFTWARE\Policies\Microsoft\FVE UseTPMKeyPIN REG_DWORD 2

Location: HKLM\SOFTWARE\Policies\Microsoft\FVE UseTPMPIN REG_DWORD 2
