#!/bin/bash

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


