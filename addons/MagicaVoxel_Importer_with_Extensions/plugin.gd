@tool
extends EditorPlugin

const VoxImporterMesh = preload ("./vox-importer-mesh.gd")
const VoxImporterMeshLibrary = preload ("./vox-importer-meshLibrary.gd")
const FramedMeshInstance = preload ("./framed_mesh_instance.gd")
const framed_mesh_instance_icon = preload ("./framed_mesh_instance.png")

var mesh_plugin
var mesh_library_plugin

func _enter_tree():
	mesh_plugin = VoxImporterMesh.new()
	mesh_library_plugin = VoxImporterMeshLibrary.new()
	add_import_plugin(mesh_plugin)
	add_import_plugin(mesh_library_plugin)
	add_custom_type("FramedMeshInstance", "MeshInstance3D", FramedMeshInstance, framed_mesh_instance_icon)

func _exit_tree():
	remove_import_plugin(mesh_plugin)
	remove_import_plugin(mesh_library_plugin)
	mesh_plugin = null
	mesh_library_plugin = null
	remove_custom_type("FramedMeshInstance")
