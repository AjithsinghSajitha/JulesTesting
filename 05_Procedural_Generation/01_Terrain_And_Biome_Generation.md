# Procedural Generation: Terrain and Biomes

The world of Veridian is procedurally generated at the beginning of each new game, creating a unique and replayable experience every time. The generation process is a multi-step pipeline that layers different geological and ecological features to produce a believable and interesting continent.

## 1. Step One: Continental Mass and Heightmap

The first step is to generate the basic landmass and its elevation.

*   **Noise Functions:** The core of the terrain generation is a series of layered noise functions (such as Perlin or Simplex noise).
    *   A low-frequency noise layer creates the basic continental shape and the location of large mountain ranges and ocean basins.
    *   Higher-frequency noise layers are added on top to create smaller hills, valleys, and other natural features, adding detail and roughness to the terrain.
*   **Hydraulic Erosion Simulation:** After the initial heightmap is generated, a hydraulic erosion simulation is run. This algorithm simulates the flow of water (rain) over the terrain. This carves out realistic riverbeds, creates smoother slopes, and deposits sediment in valleys, making the world feel much more natural and less "computer-generated."

## 2. Step Two: Temperature and Moisture Maps

Once the physical terrain is set, the climate is determined. Two invisible data maps are generated across the continent.

*   **Temperature Map:** The temperature is primarily determined by latitude and altitude.
    *   **Latitude:** The world has a defined "equator" and "poles." Areas closer to the equator are warmer, while areas closer to the poles are colder.
    *   **Altitude:** Higher elevations are colder. This allows for snow-capped mountains even in warmer regions.
*   **Moisture Map:** The moisture level is determined by proximity to oceans and the presence of mountain ranges.
    *   **Oceans:** Coastal regions are generally more humid.
    *   **Rain Shadows:** A simulation of prevailing winds is used to create rain shadows. When moist air from the ocean hits a mountain range, it rises and cools, causing rain on the windward side. The leeward side of the mountain range becomes a dry "rain shadow."

## 3. Step Three: Biome Placement

The biome for any given point on the map is determined by combining the data from the heightmap, temperature map, and moisture map. A lookup table is used to place the appropriate biome.

*   **Example Biome Rules:**
    *   **Hot + Wet:** Tropical Rainforest
    *   **Hot + Dry:** Desert
    *   **Temperate + Wet:** Temperate Rainforest / Swamp
    *   **Temperate + Average:** Deciduous Forest / Grasslands
    *   **Cold + Wet:** Taiga (Boreal Forest)
    *   **Cold + Dry:** Tundra
    *   **Very Cold (any moisture):** Arctic / Glacier
    *   **High Altitude (above tree line):** Alpine Tundra

The system blends the edges of these biomes to create smooth, natural transitions.

## 4. Step Four: River and Lake Generation

With the terrain and biomes in place, the major bodies of water are created.

*   **Rivers:** Rivers originate in high-altitude, high-moisture areas (springs in mountains) and follow the path of least resistance downwards, flowing through the channels carved by the erosion simulation until they reach the sea or a lake.
*   **Lakes:** Lakes are formed in depressions in the terrain where the water level is above the ground height.

## 5. Step Five: Resource Distribution

Finally, the world's natural resources are placed based on logical rules.

*   **Fertile Land:** Found in river valleys and temperate grasslands.
*   **Iron and Coal:** Primarily found in mountainous regions.
*   **Precious Metals (Gold, Silver):** Rare, but more likely to be found in geologically active or mountainous areas.
*   **Stone:** Abundant in hilly and mountainous terrain.
*   **Unique Resources:** Special resources (e.g., magical crystals, rare herbs) are placed in specific, rare biome types to encourage exploration.

This layered approach ensures that each generated world is not only unique but also geologically and ecologically consistent, creating a believable and immersive setting for the player's adventures.
