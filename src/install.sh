#!/usr/bin/env bash
set -e

if [ -z "${FTB_MOD}" ]; then
	# download minecraft server
	curl -Lo minecraft_server.jar ${MC_URL}
else
	# download Feed the Beast Mod
	echo "downloading ${FTB_MOD}"
	curl -SLo mod.zip ${FTB_MOD}
	unzip -o mod.zip

  	sed -i "s/-jar/-Dfml.queryResult=confirm -jar/" "${MC_HOME}/ServerStart.sh"
  	chmod +x "${MC_HOME}/ServerStart.sh"
fi

echo "eula=true" > eula.txt