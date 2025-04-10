# Valo Game Tracker

This project simulates a **Valorant-style analytics system** using SQL. It tracks players, agents, weapons, and match stats — from kills and assists to weapon accuracy. Built as part of my SQL learning journey.

---

## Schema Design

### Tables:

- `agents` – Agent info like roles (Duelist, Sentinel, etc.)
- `players` – Player profiles with region
- `matches` – Match metadata
- `player_match_stats` – Player performance in matches
- `weapons` – All weapons categorized by type
- `player_weapon_stats` – Weapon-specific stats per player per match

> ✅ Schema defined in [`schema/create_tables.sql`](schema/create_tables.sql)
