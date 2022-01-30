# shellcheck shell=sh

# set_perm_recursive <directory> <owner> <group> <dirpermission> <filepermission> [context]
#     if [context] is not set, the default is "u:object_r:system_file:s0"
#     for all files in <directory>, it will call:
#        set_perm file owner group filepermission context
#     for all directories in <directory> (including itself), it will call:
#        set_perm dir owner group dirpermission context

outdated_magisk()
{
	ui_print "*******************************"
	ui_print " Please install Magisk v24.0+! "
	ui_print "*******************************"
	abort
}
[ $MAGISK_VER_CODE -lt 24000 ] && outdated_magisk

set_perm_recursive $MODPATH/system/etc 0 0 0755 0644
set_perm_recursive $MODPATH/system/bin 0 0 0755 0755
