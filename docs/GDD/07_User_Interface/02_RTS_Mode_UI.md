# UI Mockup: RTS Mode (Overworld View)

This document describes the layout and functionality of the User Interface when the player is in the high-level Real-Time Strategy (RTS) or "Overworld" view. The UI is designed to be clean, informative, and thematic, adhering to the "Painterly Realism" style.

## Screen Layout

The screen is divided into several key areas, with the main world view taking up the majority of the screen. Most UI elements are docked to the edges of the screen to maximize visibility.

### 1. Top Bar: Faction Overview

A thin, ornate bar at the top of the screen displays the most critical information about the faction the player is currently influencing.

*   **Left Side: Faction Crest and Name:** The banner and name of the currently selected faction (e.g., "The Kingdom of Alerion"). Clicking this opens the main Faction Management panel.
*   **Center: Core Resources:** A series of icons and numbers showing the faction's primary resource stockpiles. This includes:
    *   **Food:** (Icon: Sheaf of wheat)
    *   **Wood:** (Icon: Pile of logs)
    *   **Stone:** (Icon: Pile of rocks)
    *   **Gold:** (Icon: Pile of coins)
    *   **Population:** (Icon: Human silhouette) Shows current population and housing capacity (e.g., 450/500).
    *   Hovering over any resource provides a detailed tooltip showing income and expenses per day.
*   **Right Side: Date and Time Controls:**
    *   **Current Date:** Displays the current in-game date (e.g., "17th of Sun's Height, Year 1024").
    *   **Time Controls:** Standard time manipulation buttons: Pause, Play (Normal Speed), Fast Forward (2x), and Ultra-Fast Forward (4x).

### 2. Left Side: The Ledger Panel

A vertically oriented, collapsible panel on the left side of the screen that functions as the faction's ledger. It is represented by a series of thematic icons.

*   **Military (Icon: Crossed swords):** Opens the army management screen. Shows a list of all armies, their composition, location, and current orders. Allows the player to set strategic objectives.
*   **Diplomacy (Icon: Shaking hands):** Opens the diplomacy screen. Shows a list of all other factions, their relationship value, and ongoing treaties or conflicts. This is where diplomatic actions are initiated.
*   **Technology (Icon: An open book):** Opens the technology tree. Shows the faction's progress in civic, military, and economic research. Allows the player to set research priorities.
*   **Policies (Icon: A scroll with a seal):** Opens the policy screen. Allows the player to set faction-wide policies, such as tax rates, rationing levels, and construction priorities.

### 3. Bottom Right: The Mini-Map

A circular, parchment-styled mini-map in the bottom right corner.

*   **Functionality:** Shows the local area around the camera's current focus. Displays terrain, political borders, friendly units (blue dots), and enemy units (red dots).
*   **Overlays:** Features small, toggleable buttons to overlay key information, such as resource locations or biome types.
*   **Zoom:** Clicking on the mini-map instantly moves the main camera to that location.

### 4. Bottom Center: Contextual Information Panel

This area is normally empty. When the player selects an object in the world (a city, an army, a resource node), this panel slides up to display information about that object.

*   **If City is Selected:** Shows the city's name, population, current construction queue, local happiness, and a list of notable buildings.
*   **If Army is Selected:** Shows the army's commander, unit composition, current morale, and movement speed.
*   **If NPC is Selected:** Shows the NPC's name, profession, and a "Possess" button. Clicking this begins the seamless zoom transition into Possession Mode.

This UI structure provides a large amount of information in an organized, thematic way, allowing the player to make informed strategic decisions without cluttering the main view of the beautiful, procedurally generated world.
