# Procedural Generation: Cities and Villages

The settlements of Veridian are not static set pieces. They are dynamic entities that are procedurally generated at the start of the game and can grow, shrink, and evolve over time based on the actions of their inhabitants and the pressures of the world around them.

## 1. Initial Settlement Placement

At the start of a new game, the major factions' capital cities and a number of smaller towns and villages are placed on the map according to a set of logical rules.

*   **Placement Criteria:**
    *   **Proximity to Water:** Nearly all settlements are founded near a source of fresh water, like a river or a lake. Coastal cities are placed in natural harbors.
    *   **Access to Resources:** Villages are often placed near a key resource. A village might spring up near a rich iron deposit, a dense forest, or a patch of fertile farmland.
    *   **Defensibility:** Capitals and important towns are placed in defensible locations, such as on a hill, in the bend of a river, or near a mountain pass.
    *   **Trade Routes:** Roads are generated to connect the major settlements, and smaller villages often appear along these routes.

## 2. Procedural City Layout

Each city and town has a unique layout, generated using a wave function collapse algorithm or similar techniques guided by a set of stylistic rules based on the local culture.

*   **The City Center:** The generation starts with a central point, such as a castle, a market square, or a cathedral.
*   **Road Network:** Main roads radiate out from the center, and smaller streets branch off from them, creating an organic-looking network.
*   **District Generation:** The city is divided into districts:
    *   **Noble District:** Located in a desirable area (e.g., on a hill), with large, opulent houses and wide streets.
    *   **Market District:** Centered around the main square, with shops, taverns, and guild halls.
    *   **Residential District:** The largest area, filled with the homes of commoners.
    *   **Crafting District:** Often located on the downwind side of the city, this is where blacksmiths, tanners, and other "smelly" professions are located.
*   **City Walls:** Major cities will generate with defensive walls, watchtowers, and gatehouses.

## 3. Dynamic Growth and Decline

Settlements are not static. Their population and physical size can change over the course of the game, driven by the "World AI."

*   **Growth Factors (Prosperity):**
    *   **Economic Surplus:** If a town is producing a surplus of a valuable resource (e.g., food, iron) and successfully trading it, its wealth will increase.
    *   **Security:** A town that is well-defended and safe from bandits or monsters will attract new settlers.
    *   **High Reputation:** A town known for its justice, opportunities, or a famous resident will grow faster.
*   **How Growth Manifests:**
    *   New houses are built by NPC construction workers on the outskirts of the town.
    *   Existing houses may be upgraded to larger, more impressive versions.
    *   New shops and services will open to meet the needs of the growing population.
    *   The town may eventually invest in building a defensive wall if it doesn't have one.

*   **Decline Factors (Hardship):**
    *   **Famine or Plague:** A prolonged food shortage or a disease outbreak can devastate a town's population.
    *   **War and Raiding:** A town that is repeatedly attacked and pillaged will see its people flee for safer lands.
    *   **Economic Collapse:** If a town's primary resource runs out or its trade routes are cut off, it will fall into poverty.
*   **How Decline Manifests:**
    *   Houses will fall into disrepair and become abandoned.
    *   Shops will close down.
    *   The population will shrink as people die or move away.
    *   In extreme cases, a town can become a ghost town or a ruin.

## 4. Player Impact

The player can have a massive impact on the development of settlements.

*   **Possessing a Leader:** As a mayor or lord, the player can direct the town's resources, commissioning new buildings and improving defenses.
*   **Direct Action:** As an adventurer, the player can clear out a nearby bandit camp, making the town safer and encouraging growth. As a merchant, they can establish a new, profitable trade route.
*   **Negative Impact:** The player could also lead a town to ruin by assassinating its leader, sabotaging its economy, or leading an army to its gates.

This system ensures that the world feels alive and responsive. The player can watch a tiny hamlet grow into a mighty walled city over generations, or witness the slow decay of a once-great capital, knowing that these changes are a direct result of the simulated lives of its people.
