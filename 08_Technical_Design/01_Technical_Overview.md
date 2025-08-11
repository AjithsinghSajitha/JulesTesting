# Technical Overview

This document provides a high-level overview of the proposed technical architecture and key challenges for the development of "Dynasty of the Voiceless."

## 1. Game Engine Considerations

The choice of game engine is one of the most critical technical decisions. The ideal engine must excel in two areas: rendering massive, open worlds and handling extremely complex, persistent simulations.

*   **Primary Candidates:**
    *   **Unreal Engine:**
        *   **Pros:** World-class rendering capabilities (Lumen, Nanite) are ideal for the "Painterly Realism" art style. Strong support for large-scale worlds (World Partition). Blueprints allow for rapid prototyping of complex gameplay systems.
        *   **Cons:** The "World AI" and deep simulation aspects may require significant custom C++ development, as Blueprints might not be performant enough for thousands of NPCs.
    *   **Unity:**
        *   **Pros:** Highly flexible and customizable. The C# language is excellent for complex simulation logic. The DOTS (Data-Oriented Technology Stack) framework is theoretically perfect for the performance demands of the "World AI."
        *   **Cons:** Unity's high-end rendering pipeline may require more work to achieve the target visual quality compared to Unreal. DOTS has a steep learning curve and is still evolving.
*   **Recommendation:** A thorough evaluation and prototyping phase is required. Initial lean is towards **Unreal Engine** for its visual prowess, with the understanding that a dedicated team of C++ engineers will be needed to build a custom, highly-performant simulation layer for the "World AI."

## 2. Key Technical Challenges

### a. The "World AI" Simulation
This is the single greatest technical challenge. The system must track the needs, goals, relationships, and knowledge of thousands of individual NPCs simultaneously without crippling the game's performance.
*   **Proposed Solution:**
    *   **Data-Oriented Design:** Regardless of the engine, the AI's core data (needs, relationships, etc.) must be stored in a data-oriented structure for fast, cache-friendly processing.
    *   **Level of Detail (LOD) for AI:** NPCs do not need to run their full logic all the time.
        *   **High Detail:** NPCs in the player's immediate vicinity run their full GOAP logic and detailed animations.
        *   **Medium Detail:** NPCs in the same loaded region but out of sight run a simplified "logic tick" (e.g., updating their needs and long-term goals, but not pathfinding).
        *   **Low Detail (Abstract Simulation):** NPCs in unloaded regions of the world exist only as data. Their lives are resolved via an abstract simulation. For example, the system calculates that a farmer has worked their fields and generated X amount of food, without ever actually simulating their movement.

### b. Procedural World Generation
The system must generate a vast, believable, and interesting world.
*   **Proposed Solution:**
    *   **Asynchronous Generation:** The world is generated once at the start of a new game. This process can be hidden behind an introductory cinematic.
    *   **Layered Pipeline:** Use the layered approach detailed in the PG documents (Heightmap -> Climate -> Biomes -> Resources -> Settlements). This makes the process art-directable and easier to debug.

### c. Seamless Scale-Shifting
The transition from the RTS view to the first-person Possession mode must be instantaneous, with no loading screens.
*   **Proposed Solution:**
    *   This is primarily a camera and asset streaming challenge. The engine's world partitioning/streaming system is critical.
    *   When in RTS view, the engine loads low-poly versions of assets. As the camera zooms in to possess an NPC, the engine must seamlessly stream in the high-resolution assets for that character and their immediate surroundings. This requires careful asset optimization and a fast storage solution (SSD is a likely minimum requirement).

## 3. Networking and Multiplayer

While the core game is single-player, the design lends itself to potential multiplayer modes.

*   **Co-op Mode:** One player acts as the "Overmind" in the RTS view, while one or more other players can possess NPCs in the world, acting as the Overmind's "agents."
*   **Competitive Mode:** Two or more players control rival factions, competing for control of the continent in a persistent online world.
*   **Technical Approach:** The simulation logic must be server-authoritative to prevent cheating. The "abstract simulation" for low-detail NPCs is key to making a persistent multiplayer world feasible. This would be a significant undertaking, recommended for a post-launch expansion.
