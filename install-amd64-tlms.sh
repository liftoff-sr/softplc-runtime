#!/bin/bash

# Here we:

# 1) install all the standard TLMs for an amd64 machine

# 2) create a /SoftPLC/cfg directory and move all TLM configuration files
# and all ONE configuration files and STARTUP.LST and MODULE.LST files into
# /SoftPLC/cfg/.
# In their original locations symlinks are created pointing to the corresponding
# actual file in /SoftPLC/cfg.  This lets us move configuration files onto the
# host while leaving the TLM executables in the container.  A bind mount
# is used on the container's /SoftPLC/cfg directory to maintain the configuration
# files on the host instead of the container.


pkgs="\
  tlm-comgenius \
  tlm-dtdisk \
  tlm-enron-modtcp \
  tlm-ether-ip \
  tlm-ktxrio  \
  tlm-logger \
  tlm-mbipmast \
  tlm-mbipslav \
  tlm-modbmast \
  tlm-modbslav \
  tlm-sendmail \
  tlm-slc \
  tlm-splcmisc \
  tlm-tagwell \
  tlm-web \
"

#echo "$pkgs"


mkdir /SoftPLC/cfg

apt-get install -y $pkgs

function move_and_symlink()
{
	local src=$1
	local dst=$2
	local bn=`basename $src`

	#echo "mv $src $dst"
	mv $src $dst

	#echo "ln -s $dst/$bn $src"
	ln -s "$dst/$bn" $src
}



move_and_symlink /SoftPLC/tlm/COMGENIUS.LST  	/SoftPLC/cfg
move_and_symlink /SoftPLC/tlm/ENRON.XML  	/SoftPLC/cfg
move_and_symlink /SoftPLC/tlm/ETHER_IP.LST	/SoftPLC/cfg
move_and_symlink /SoftPLC/tlm/KTX.LST		/SoftPLC/cfg
move_and_symlink /SoftPLC/tlm/LOGGER.LST		/SoftPLC/cfg
move_and_symlink /SoftPLC/tlm/MBIPMAST.XML	/SoftPLC/cfg
move_and_symlink /SoftPLC/tlm/MBIPSLAV.LST	/SoftPLC/cfg
move_and_symlink /SoftPLC/tlm/MODBMAST.XML	/SoftPLC/cfg
move_and_symlink /SoftPLC/tlm/MODBSLAV.LST	/SoftPLC/cfg
move_and_symlink /SoftPLC/tlm/SENDMAIL.LST	/SoftPLC/cfg
move_and_symlink /SoftPLC/tlm/TAGWELL.LST	/SoftPLC/cfg
move_and_symlink /SoftPLC/tlm/WEB.LST		/SoftPLC/cfg

move_and_symlink /SoftPLC/run/ONEDVR.CFG		/SoftPLC/cfg
move_and_symlink /SoftPLC/run/ONETCP.CFG		/SoftPLC/cfg
move_and_symlink /SoftPLC/run/ONEKT.CFG		/SoftPLC/cfg
#move_and_symlink /SoftPLc/run/ONESMART.CFG	/SoftPLC/cfg
move_and_symlink /SoftPLC/run/ONECOM.CFG		/SoftPLC/cfg

move_and_symlink /SoftPLC/run/MODULE.LST		/SoftPLC/cfg
move_and_symlink /SoftPLC/run/STARTUP.LST	/SoftPLC/cfg


