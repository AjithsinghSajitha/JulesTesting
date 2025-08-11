# Epic 1: Terrain & Biome Generation

**Epic Goal:** To create a system in Godot that procedurally generates the world's physical landmass, including varied terrain features like mountains, plains, and valleys, and then defines the climate and biome for every part of the map. The entire system must be art-directable and repeatable via a global seed.

---

## Sprint 1: Foundational Terrain Mesh

**Sprint Goal:** To create a basic, visible 3D terrain mesh from a single noise pattern. This sprint focuses on establishing the core pipeline of noise-to-geometry.

*   **User Story 1.1: Project Setup**
    *   **As a developer,** I need to create a new Godot project and a main scene (`world_gen_test.tscn`) to serve as the testing environment for all procedural generation work.
    *   **Acceptance Criteria:** The project is created. A `Node3D` is the root of the test scene. A `Camera3D` and a `DirectionalLight3D` are set up to view the generated mesh.

*   **User Story 1.2: Noise Resource Creation**
    *   **As a developer,** I need to create a `FastNoiseLite` resource in the Godot editor and configure it to produce a simple Perlin noise pattern.
    *   **Acceptance Criteria:** A `FastNoiseLite` resource (`perlin_noise.tres`) exists in the project. The noise type is set to "Perlin", and the frequency is set to a value suitable for basic hills (e.g., 0.02).

*   **User Story 1.3: Heightmap Generation**
    *   **As a developer,** I need to create a `NoiseTexture2D` resource that uses the `perlin_noise.tres` resource to generate a grayscale image (the heightmap).
    *   **Acceptance Criteria:** A `NoiseTexture2D` resource (`heightmap_texture.tres`) exists. Its `noise` property is linked to the `perlin_noise.tres` resource. The texture can be viewed in the inspector.

*   **User Story 1.4: Procedural Mesh Generation**
    *   **As a developer,** I need to write a GDScript (`terrain_generator.gd`) that can be attached to a `MeshInstance3D` node. This script will:
        1.  Read the pixel data from the `heightmap_texture.tres`.
        2.  Use the `SurfaceTool` to construct a grid mesh, where the Y-value of each vertex is determined by the brightness of the corresponding pixel in the heightmap.
        3.  Generate vertex normals to ensure correct lighting.
        4.  Commit the generated surface to an `ArrayMesh` and assign it to the `MeshInstance3D`.
    *   **Acceptance Criteria:** When the scene is run, a 3D terrain plane with visible hills and valleys is generated.

---

## Sprint 2: Advanced Terrain & Art-Directability

**Sprint Goal:** To enhance the terrain's complexity by layering multiple noise functions and to expose all relevant parameters in the Godot inspector for artists and designers.

*   **User Story 2.1: Layered Noise System**
    *   **As a developer,** I need to refactor `terrain_generator.gd` to accept an array of `FastNoiseLite` resources instead of a single `NoiseTexture2D`. The script should generate and combine these noise patterns in-memory before creating the final heightmap.
    *   **Acceptance Criteria:** The script has an exported array variable for `FastNoiseLite` resources. The generator can blend two or more noise patterns (e.g., a low-frequency Perlin for continents, a high-frequency Ridged for mountains).

*   **User Story 2.2: Inspector Parameters**
    *   **As a developer,** I need to export all key generation variables from `terrain_generator.gd` so they can be tweaked in the inspector. This includes:
        *   `world_seed`: An integer to control the randomization.
        *   `world_size`: A `Vector2i` for the dimensions of the terrain chunk.
        *   `height_scale`: A float to control the vertical exaggeration of the terrain.
    *   **Acceptance Criteria:** Changing these values in the Godot Editor's inspector and re-running the scene produces a different, predictable result.

*   **User Story 2.3: Domain Warping**
    *   **As a developer,** I need to leverage Godot's `FastNoiseLite` Domain Warp feature to create more natural, distorted terrain.
    *   **Acceptance Criteria:** At least one of the noise layers uses Domain Warp, enabled via an exported boolean. The amplitude and frequency of the warp can be controlled from the inspector. The resulting terrain shows swirling, non-linear patterns.

---

## Sprint 3: Hydraulic Erosion & Water Systems

**Sprint Goal:** To simulate the effect of water on the terrain to carve out more realistic features, and to define sea level and river paths.

*   **User Story 3.1: Hydraulic Erosion Simulation**
    *   **As a developer,** I need to implement a hydraulic erosion algorithm that operates on the raw heightmap data (a 2D array of floats) *before* the mesh is generated. The algorithm should simulate rainfall, water flow, sediment erosion, and deposition.
    *   **Acceptance Criteria:** After the erosion process, the terrain exhibits more realistic features like smoother slopes, carved-out riverbeds, and alluvial plains. The strength and duration of the erosion can be controlled from the inspector.

*   **User Story 3.2: Defining Sea Level**
    *   **As a developer,** I need to add a `sea_level` float parameter to the `terrain_generator.gd`. The generated mesh should be flat for any heightmap values below this level.
    *   **Acceptance Criteria:** A flat, blue plane representing the ocean is visible at a controllable height.

*   **User Story 3.3: River Path Generation**
    *   **As a developer,** I need to identify river paths from the hydraulic erosion simulation (areas with high water flow) and store them as an array of `Vector3` points.
    *   **Acceptance Criteria:** A debug view can be toggled to draw lines representing the generated river paths onto the terrain.

---

## Sprint 4: Climate Simulation & Biome Coloring

**Sprint Goal:** To generate climate data (temperature, moisture) and use it to assign and visualize biomes on the terrain.

*   **User Story 4.1: Climate Map Generation**
    *   **As a developer,** I need to generate two additional `NoiseTexture2D`s: one for temperature and one for moisture.
        *   Temperature should be influenced by a simple latitude gradient (e.g., warmer at Z=0, colder at Z=max).
        *   Moisture should be influenced by a rain shadow effect (e.g., drier on one side of mountain ranges).
    *   **Acceptance Criteria:** The generator script holds data for elevation, temperature, and moisture for every point on the map.

*   **User Story 4.2: Biome Definition Resource**
    *   **As a developer,** I need to create a custom `Resource` script (`biome_data.gd`) that defines a biome. It should contain:
        *   `biome_name` (String)
        *   `min_temp`, `max_temp` (float)
        *   `min_moisture`, `max_moisture` (float)
        *   `terrain_color` (Color)
    *   **Acceptance Criteria:** I can create and save different biome definitions (e.g., `desert.tres`, `forest.tres`, `tundra.tres`) in the editor.

*   **User Story 4.3: Biome Coloring Shader**
    *   **As a developer,** I need to write a custom shader for the terrain mesh. This shader will take the climate maps (temperature and moisture) as uniforms and color the terrain based on a lookup table of biomes.
    *   **Acceptance Criteria:** The generated 3D terrain is colored according to the biome rules. Deserts are yellow, forests are green, tundra is white, etc., creating a recognizable world map.
