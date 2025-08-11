@tool
extends MeshInstance3D

# Exports to allow tweaking in the Godot Editor
@export var width: int = 128
@export var height: int = 128
@export var height_scale: float = 20.0
@export var heightmap_texture: Texture2D

# This function is called when the node is ready, both in-game and in the editor (due to @tool).
func _ready() -> void:
	# Don't generate in the editor unless a texture is assigned
	if not Engine.is_editor_hint() or heightmap_texture:
		generate_terrain()

# The core function for generating the terrain mesh
func generate_terrain() -> void:
	if not heightmap_texture:
		print_error("Heightmap texture not provided. Cannot generate terrain.")
		return

	var st = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)

	# Get the image data from the texture
	var image = heightmap_texture.get_image()
	if image == null:
		print_error("Failed to get image from heightmap texture.")
		return

	# Ensure the image dimensions match our expected width/height for safety
	# In a real scenario, you might resize the image or use its dimensions directly
	if image.get_width() != width or image.get_height() != height:
		print_warning("Image dimensions do not match width/height properties. Using image dimensions.")
		width = image.get_width()
		height = image.get_height()

	# Main loop to generate vertices
	for y in range(height):
		for x in range(width):
			# Get the height value from the grayscale value of the pixel
			var pixel_height = image.get_pixel(x, y).r * height_scale

			# Define vertex position
			var vertex = Vector3(x - width / 2.0, pixel_height, y - height / 2.0)

			# Define UV coordinates for texturing
			var uv = Vector2(float(x) / width, float(y) / height)

			st.set_uv(uv)
			st.add_vertex(vertex)

	# Second loop to create indices for the triangles
	for y in range(height - 1):
		for x in range(width - 1):
			var a = y * width + x
			var b = y * width + x + 1
			var c = (y + 1) * width + x
			var d = (y + 1) * width + x + 1

			# First triangle
			st.add_index(a)
			st.add_index(c)
			st.add_index(b)

			# Second triangle
			st.add_index(b)
			st.add_index(c)
			st.add_index(d)

	# Generate normals for correct lighting
	st.generate_normals()

	# Generate tangents for normal mapping
	st.generate_tangents()

	# Create the mesh from the SurfaceTool data
	var array_mesh = st.commit()
	self.mesh = array_mesh
	print("Terrain generated successfully.")
