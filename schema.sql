CREATE TABLE `generations` (
	`id` integer PRIMARY KEY NOT NULL,
	`name` text NOT NULL
);

CREATE TABLE `pokemon` (
	`id` text PRIMARY KEY NOT NULL,
	`name` text NOT NULL,
	`national_index` integer NOT NULL,
	`generation_id` integer NOT NULL,
	FOREIGN KEY (`generation_id`) REFERENCES `generations`(`id`) ON UPDATE no action ON DELETE no action
);

CREATE TABLE `types` (
	`id` text PRIMARY KEY NOT NULL,
	`name` text NOT NULL
);

CREATE TABLE `pokemon_forms` (
	`id` text PRIMARY KEY NOT NULL,
	`name` text NOT NULL,
	`pokemon_id` text NOT NULL,
	`form` text,
	`generation_id` integer NOT NULL,
	`primary_type_id` text NOT NULL,
	`secondary_type_id` text,
	`hp` integer NOT NULL,
	`attack` integer NOT NULL,
	`defense` integer NOT NULL,
	`special_attack` integer NOT NULL,
	`special_defense` integer NOT NULL,
	`speed` integer NOT NULL,
	`height` real NOT NULL,
	`weight` real NOT NULL,
	FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`generation_id`) REFERENCES `generations`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`primary_type_id`) REFERENCES `types`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`secondary_type_id`) REFERENCES `types`(`id`) ON UPDATE no action ON DELETE no action
);

CREATE UNIQUE INDEX `generations_name_unique` ON `generations` (`name`);
CREATE UNIQUE INDEX `pokemon_name_unique` ON `pokemon` (`name`);
CREATE UNIQUE INDEX `pokemon_national_index_unique` ON `pokemon` (`national_index`);
CREATE UNIQUE INDEX `types_name_unique` ON `types` (`name`);