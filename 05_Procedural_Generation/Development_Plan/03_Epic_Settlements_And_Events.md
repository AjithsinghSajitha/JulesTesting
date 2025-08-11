# Epic 3: Settlement & Event Generation

**Epic Goal:** To breathe intelligent life into the world by procedurally generating settlements, from small villages to large cities, and to create a dynamic event system ("Opportunities") that generates emergent quests based on the state of the world simulation.

---

## Sprint 1: Macro-Scale Civilization

**Sprint Goal:** To place the initial locations of settlements and connect them with a road network on the world map. This sprint focuses on the broad strokes of civilization.

*   **User Story 1.1: Settlement Site Selection**
    *   **As a developer,** I need to create a `CivilizationManager` that analyzes the final terrain and biome data (from Epic 1) to identify optimal locations for settlements.
    *   **Logic:** The algorithm should score potential locations based on factors like proximity to fresh water, availability of flat land for building, access to key resources (farmland, forests, ore), and defensibility.
    *   **Acceptance Criteria:** The manager outputs a list of `Vector3` coordinates for the highest-scoring potential settlement sites. A debug view can show these points on the map.

*   **User Story 1.2: Road Network Generation**
    *   **As a developer,** I need to implement an A* pathfinding algorithm that operates on a graph where the settlement sites are nodes. The pathfinding cost should be influenced by terrain steepness (it's harder to build roads up mountains).
    *   **Acceptance Criteria:** The `CivilizationManager` generates a network of roads connecting the primary settlement locations. A debug view can draw this road network onto the terrain.

*   **User Story 1.3: Basic Settlement Spawning**
    *   **As a developer,** I need to spawn a simple placeholder `Node3D` at each chosen settlement location to represent the town center.
    *   **Acceptance Criteria:** When the world is generated, placeholder objects for towns and cities appear at logical locations on the map.

---

## Sprint 2: Procedural City & Village Layout

**Sprint Goal:** To generate the detailed layout of individual settlements, including buildings, streets, and walls, based on the settlement's size and location.

*   **User Story 2.1: Building Block Scenes**
    *   **As a designer,** I need to create a library of `PackedScene`s for various medieval building types (e.g., `house_small.tscn`, `house_large.tscn`, `blacksmith_shop.tscn`, `town_hall.tscn`, `castle_wall.tscn`).
    *   **Acceptance Criteria:** A variety of pre-fabricated building blocks are available in the project for the generator to use.

*   **User Story 2.2: City Layout Generator**
    *   **As a developer,** I need to create a `CityGenerator` script. For a given settlement point and a population value, this script should procedurally generate a layout for the city.
    *   **Method:** This could use a growing algorithm that starts with a main road and branches off smaller streets, placing building plots along them. It should designate different districts (e.g., market, residential).
    *   **Acceptance Criteria:** The generator outputs a set of transforms for each building and road segment. A 2D debug view can draw the generated city map.

*   **User Story 2.3: Building Instantiation**
    *   **As a developer,** the `CityGenerator` must instantiate the appropriate building `PackedScene` at each transform generated in the layout.
    *   **Acceptance Criteria:** Running the generator creates a fully-realized, walkable 3D village or city on the terrain.

---

## Sprint 3: The Opportunity System - Problem Detection

**Sprint Goal:** To create the backend system that can analyze the world state and identify "problems" that can be turned into dynamic quests.

*   **User Story 3.1: Opportunity Data Resource**
    *   **As a developer,** I need to create an `OpportunityData` custom resource (`opportunity_data.gd`).
    *   **Data Points:** It should store the `problem_description` (String), `goal_description` (String), `requesting_npc` (NodePath), and a list of conditions for completion.
    *   **Acceptance Criteria:** An `OpportunityData` resource can be created and configured in code.

*   **User Story 3.2: World State Scanners**
    *   **As a developer,** I need to create an `OpportunityManager` singleton. This manager will run periodic checks on the world state.
    *   **Initial Scanners:**
        1.  **Settlement Needs:** Check if a settlement's resources (e.g., food stockpile) are below a critical threshold.
        2.  **Ecological Threats:** Check if a predator's spawn area overlaps with a settlement's boundaries.
    *   **Acceptance Criteria:** The manager can detect when a village is low on food or when wolves are too close to a town and logs this "problem" to the console.

*   **User Story 3.3: Opportunity Generation**
    *   **As a developer,** when a problem is detected by a scanner, the `OpportunityManager` should create a new `OpportunityData` resource instance and populate it with the relevant information.
    *   **Acceptance Criteria:** When a food shortage is detected in "Oakwood", a new `OpportunityData` is created with a description like "Oakwood is running out of food!" and a goal like "Deliver 50 food to the town hall."

---

## Sprint 4: The Opportunity System - Player Interaction

**Sprint Goal:** To create the player-facing systems that allow them to discover, accept, and complete the dynamically generated Opportunities.

*   **User Story 4.1: NPC Dialogue Integration**
    *   **As a developer,** I need to create a system where an NPC involved in an Opportunity (e.g., the mayor of a hungry town) will have a special dialogue option related to their problem.
    *   **Acceptance Criteria:** When the player talks to the mayor of Oakwood, they will have a dialogue option like "[Opportunity] I hear you're having trouble with your food supply."

*   **User Story 4.2: Goal Completion Logic**
    *   **As a developer,** I need to implement the logic to check if an Opportunity's goal has been met.
    *   **Examples:**
        *   For a delivery quest, check if the player has transferred the required item to the target NPC's inventory.
        *   For a hunting quest, listen for the `death` signal from the target creature(s).
    *   **Acceptance Criteria:** The `OpportunityManager` can successfully detect when a player's action has fulfilled the win condition of an active Opportunity.

*   **User Story 4.3: Reward System**
    *   **As a developer,** when an Opportunity is completed, the system should grant the player a reward.
    *   **Acceptance Criteria:** Upon successful completion of the "Deliver Food" opportunity, the player's gold amount increases, and they receive a positive reputation change with the town of Oakwood. The `OpportunityManager` removes the completed Opportunity from the active list.
