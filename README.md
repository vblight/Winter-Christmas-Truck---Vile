<div align="center">

# 🎄 RUNE Pirog M3X — Winter Christmas Truck 🎄

### A festive delivery truck for FiveM

**Free download · Standalone add-on vehicle · Version 1.9.0**

*Created and packaged by Vile*

</div>

---

## 🎁 About the truck

Bring a little Christmas cheer to the streets of Los Santos with the **RUNE Pirog M3X Winter Delivery** — a winter-themed delivery truck with festive lighting, seasonal styling and working rear-door controls.

Whether you're running Christmas deliveries, a winter event or simply want something festive on your server, this truck is here for the holidays.

> **Preview screenshots:** Real in-game screenshots will be added here. Appearance can vary with graphics and weather settings.

## ✨ Features

- 🎄 Festive winter delivery truck styling
- 💡 Toggleable festive lights (default key: **K**)
- 🚪 Rear cargo door controls
- 🎨 Vehicle livery and colour handling
- 📦 Optional rear-door interaction when opening a matching trunk through **qb-inventory**
- 🚚 Custom add-on spawn name: `rune_pirogm3x`
- 🧩 Standalone vehicle resource; no framework needed for the vehicle itself

## 📥 Installation

1. Download the release ZIP from the [Releases page](https://github.com/vblight/Winter-Christmas-Truck---Vile/releases).
2. Extract it and place the **`rune_pirogm3x`** folder in your FiveM server's `resources` directory.
3. Add this line to `server.cfg`:

   ```cfg
   ensure rune_pirogm3x
   ```

4. Restart your server or start the resource.
5. Spawn the vehicle using **`rune_pirogm3x`**.

**Important:** The `fxmanifest.lua` file should be directly inside the `rune_pirogm3x` resource folder.

## 🎮 Controls & commands

| Control | What it does |
| --- | --- |
| `K` | Toggle festive lights while driving the truck |
| `/pirogm3xdoors` | Open or close the rear cargo doors |
| `/pirogm3xtest` | Spawn a local test truck nearby |
| `/pirogm3xclear` | Remove the local test truck |

The festive-light key can be changed in FiveM's key bindings.

## 🧰 Compatibility notes

- **FiveM** is required.
- The vehicle itself is **standalone**; no ESX or QBCore framework is required.
- The included `cargo_client.lua` has an **optional qb-inventory hook** to open the rear doors when the matching trunk inventory is opened. This feature is not needed to drive or use the truck.
- If another resource uses the same spawn name, remove the conflict.

## 📁 Resource contents

```text
rune_pirogm3x/
├── fxmanifest.lua
├── client.lua
├── cargo_client.lua
├── winter.lua
├── labels.lua
├── data/
│   ├── carcols.meta
│   ├── carvariations.meta
│   ├── handling.meta
│   ├── vehiclelayouts.meta
│   └── vehicles.meta
└── stream/
    ├── rune_pirogm3x.yft
    ├── rune_pirogm3x_hi.yft
    └── rune_pirogm3x.ytd
```

## 📸 Screenshots

*Coming soon — actual FiveM screenshots of the truck.*

## ❤️ Credits & support

**FiveM resource author:** Vile

For issues, questions or installation help, use this repository's [Issues](https://github.com/vblight/Winter-Christmas-Truck---Vile/issues) section or the Cfx.re release topic when available.

This is a free, unofficial community vehicle release. GTA V and FiveM are owned by their respective rights holders. The resource manifest identifies Vile as its author; original 3D-model attribution has not been independently established from the included files.

---

<div align="center">

### 🎅 Merry Christmas from Vile!

**Enjoy the truck, spread some festive cheer, and have fun out there.** 🚛❄️

</div>
