import sharp from 'sharp';
import { glob } from 'node:fs/promises';
import path from 'node:path';

for await (const file of glob('temp/*.png')) {
	const output = path.join(
		'public/screenshots',
		path.basename(file, '.png') + '.webp',
	);

	await sharp(file)
		.resize({ width: 800, height: 800, fit: 'inside', withoutEnlargement: true })
		.webp({ quality: 70 })
		.toFile(output);
}
