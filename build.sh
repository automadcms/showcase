#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

gallery=""

while IFS=$'\t' read -r title url screenshot; do
	item=$(cat <<-ITEM
		<a class="gallery-item" href="${url}" target="_blank" rel="noopener">
			<div class="gallery-frame">
				<img src="screenshots/${screenshot}" alt="${title}" loading="lazy">
			</div>
			<span class="gallery-title">${title}</span>
		</a>
	ITEM
	)
	gallery+="${item}"$'\n'
done < <(jq -r '.[] | [.title, .url, .screenshot] | @tsv' sites.json)

template=$(cat template.html)
output="${template//__SITES__/$gallery}"

printf '%s\n' "$output" > public/index.html
