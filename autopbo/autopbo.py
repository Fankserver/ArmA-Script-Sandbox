import os
import subprocess
import shutil

GIT_REPO_NAME = 'altislife'
ARMA_DIRECTORY = 'C:/Program Files (x86)/Steam/SteamApps/common/Arma 3/'
PBO_DIRECTORIES = {	'life_server' : '@life_server/addons/', \
					'Altis_Life_RPG.Altis' : 'MPMissions/'}
DEVNULL = open(os.devnull, 'wb')

for directory, destination in PBO_DIRECTORIES.items():
	target = '../' + GIT_REPO_NAME + '/' + directory
	proc = subprocess.call(['cpbo.exe', '-y', '-p', target], stdout=DEVNULL, stderr=DEVNULL)
	if proc != 1:
		print 'autopbo: pbo packing failed:', proc, target
	elif proc == 1:
		print 'autopbo: pbo packed and shared', target
		src_filename = target + '.pbo'
		dst_filename = directory+ '.pbo'
		shutil.copyfile(src_filename, ARMA_DIRECTORY + destination + dst_filename)