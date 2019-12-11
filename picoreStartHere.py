import picore
proj = picore.Project()
shot = proj.getShot("st", "1040")
shot.get_frame_range(task="composite")

python:picore
python:mzWorkFileManager
python:bakeList
maya:bakeUtils
shell:jobCenter
