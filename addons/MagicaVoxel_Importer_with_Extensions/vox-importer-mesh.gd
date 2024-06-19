@tool
extends EditorImportPlugin

const VoxImporterCommon = preload ("./vox-importer-common.gd")

func _init():
	print('MagicaVoxel Mesh Importer: Ready')

func _get_import_order():
	return 0

func _get_importer_name():
	return 'MagicaVoxel.With.Extensions.To.Mesh'

func _get_visible_name():
	return 'MagicaVoxel Mesh'

func _get_priority():
	return 1.0

func _get_recognized_extensions():
	return ['vox']

func _get_resource_type():
	return 'Mesh'

func _get_save_extension():
	return 'mesh'

func _get_preset_count():
	return 0

func _get_preset_name(_preset):
	return 'Default'

func _get_import_options(_path, _preset):
	return [
		{
			'name': 'Scale',
			'default_value': 0.1
		},
		{
			'name': 'GreedyMeshGenerator',
			'default_value': true
		},
		{
			'name': 'SnapToGround',
			'default_value': false
		},
		{
			'name': 'FirstKeyframeOnly',
			'default_value': true
		}
	]

func _get_option_visibility(_path, _option, _options):
	return true

func _import(source_path, destination_path, options, _platforms, _gen_files):
	var meshes = VoxImporterCommon.new().import(source_path, destination_path, options, _platforms, _gen_files)
	return ResourceSaver.save(meshes[0], "%s.%s" % [destination_path, _get_save_extension()])
