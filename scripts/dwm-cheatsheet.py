#!/usr/bin/env python3
import re
import sys


def parse_layouts(content):
    layouts = []
    pattern = re.compile(r'\{\s*"([^"]+)"\s*,\s*([^}]+)\}')
    for match in pattern.finditer(content):
        symbol = match.group(1).strip().replace("|", "\\|")
        function = match.group(2).strip().rstrip(",")
        layouts.append((symbol, function))
    return layouts


def parse_keys(content):
    keys = []
    key_pattern = re.compile(r"\{\s*([^,]+),\s*([^,]+),\s*([^,]+),\s*(.*?)\},")
    for line in content.splitlines():
        line = line.strip()
        if line.startswith("{"):
            m = key_pattern.match(line)
            if m:
                modifier = m.group(1).strip().replace("|", "\\|")
                key = m.group(2).strip()
                function = m.group(3).strip()
                argument = m.group(4).strip()
                keys.append((modifier, key, function, argument))
        elif line.startswith("TAGKEYS("):
            m = re.search(r"TAGKEYS\(\s*([^,]+),\s*([^)]+)\)", line)
            if m:
                key_val = m.group(1).strip()
                tag_val = m.group(2).strip()
                keys.append(("MODKEY", key_val, "view", "{.ui = 1 << %s}" % tag_val))
                keys.append(
                    (
                        "MODKEY\\|ControlMask",
                        key_val,
                        "toggleview",
                        "{.ui = 1 << %s}" % tag_val,
                    )
                )
                keys.append(
                    ("MODKEY\\|ShiftMask", key_val, "tag", "{.ui = 1 << %s}" % tag_val)
                )
                keys.append(
                    (
                        "MODKEY\\|ControlMask\\|ShiftMask",
                        key_val,
                        "toggletag",
                        "{.ui = 1 << %s}" % tag_val,
                    )
                )
    return keys


def parse_buttons(content):
    buttons = []
    btn_pattern = re.compile(
        r"\{\s*([^,]+),\s*([^,]+),\s*([^,]+),\s*([^,]+),\s*(.*?)\},"
    )
    for line in content.splitlines():
        line = line.strip()
        if line.startswith("{"):
            m = btn_pattern.match(line)
            if m:
                click = m.group(1).strip()
                event_mask = m.group(2).strip()
                button = m.group(3).strip()
                function = m.group(4).strip()
                argument = m.group(5).strip()
                buttons.append((click, event_mask, button, function, argument))
    return buttons


def generate_markdown(layouts, keys, buttons):
    md_content = "# DWM Cheatsheet\n\n"

    if layouts:
        md_content += "## Layouts\n\n"
        md_content += "| Symbole | Fonction |\n"
        md_content += "|---------|----------|\n"
        for symbol, function in layouts:
            md_content += f"| `{symbol}` | `{function}` |\n"
        md_content += "\n"

    if keys:
        md_content += "## Key Bindings\n\n"
        md_content += "| Modificateur | Touche | Fonction | Argument |\n"
        md_content += "|-------------|--------|----------|----------|\n"
        for modifier, key, function, argument in keys:
            md_content += f"| `{modifier}` | `{key}` | `{function}` | `{argument}` |\n"
        md_content += "\n"

    if buttons:
        md_content += "## Button Bindings\n\n"
        md_content += "| Clic | Mask | Bouton | Fonction | Argument |\n"
        md_content += "|------|------|--------|----------|----------|\n"
        for click, event_mask, button, function, argument in buttons:
            md_content += f"| `{click}` | `{event_mask}` | `{button}` | `{function}` | `{argument}` |\n"
        md_content += "\n"

    return md_content


def main():
    if len(sys.argv) < 3:
        print("Usage: {} config.h output.md".format(sys.argv[0]))
        sys.exit(1)

    config_file = sys.argv[1]
    output_file = sys.argv[2]

    with open(config_file, "r", encoding="utf-8") as f:
        content = f.read()

    layouts_block = re.search(
        r"static const Layout layouts\[\] = \{(.*?)\};", content, re.DOTALL
    )
    keys_block = re.search(
        r"static const Key keys\[\] = \{(.*?)\};", content, re.DOTALL
    )
    buttons_block = re.search(
        r"static const Button buttons\[\] = \{(.*?)\};", content, re.DOTALL
    )

    layouts = parse_layouts(layouts_block.group(1)) if layouts_block else []
    keys = parse_keys(keys_block.group(1)) if keys_block else []
    buttons = parse_buttons(buttons_block.group(1)) if buttons_block else []

    markdown_content = generate_markdown(layouts, keys, buttons)

    with open(output_file, "w", encoding="utf-8") as f:
        f.write(markdown_content)

    print(f"✅ Fichier Markdown généré : {output_file}")


if __name__ == "__main__":
    main()
