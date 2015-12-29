CREATE TABLE import (
    id timestamp PRIMARY KEY,
    name varchar(255),
    media_path varchar(255)
);


CREATE TABLE fdata (
    id SERIAL PRIMARY KEY,
    import_id timestamp REFERENCES import (id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    "productMuid" varchar(255),
    "productNumber" varchar(255),
    "productOverrideInsertNew" varchar(255),
    "productDisplaySortValue" varchar(255),
    "articleMuid" varchar(255),
    "articleNumber" varchar(255),
    "articlePrice" varchar(255),
    "articleWeight" varchar(255),
    "articleVolume" varchar(255),
    "articleArea" varchar(255),
    "articleLength" varchar(255),
    "articleUses" varchar(255),
    "articleShippingWeight" varchar(255),
    "articleShippingHeight" varchar(255),
    "articleShippingWidth" varchar(255),
    "articleShippingDepth" varchar(255),
    "articleMinQuantity" varchar(255),
    "articleQuantitySteps" varchar(255),
    "articlePackagingUnit" varchar(255),
    "articleEanCode" varchar(255),
    "articleStock" varchar(255),
    "articleShowStock" varchar(255),
    "articleAdjMakerData" varchar(255),
    "articleMsrPrice" varchar(255),
    "articleUnreducedPrice" varchar(255),
    "articleUnreducedPriceType" varchar(255),
    "articleMerchantInfo" varchar(255),
    "articleBarCode" varchar(255),
    "articleSortValue" varchar(255),
    "productImages" text,
    "articleImages" text,
    "articleCurrency" varchar(10),
    "articleTaxCategory" varchar(255),
    "articleRestrictDeliveryToZone" varchar(255),

    "productName de_AT" varchar(255),
    "productName de_DE" varchar(255),
    "productName en_US" varchar(255),
    "productName es_ES" varchar(255),
    "productName fr_FR" varchar(255),

    "productBrand de_AT" varchar(255),
    "productBrand de_DE" varchar(255),
    "productBrand en_US" varchar(255),
    "productBrand es_ES" varchar(255),
    "productBrand fr_FR" varchar(255),

    "productCorporation de_AT" varchar(255),
    "productCorporation de_DE" varchar(255),
    "productCorporation en_US" varchar(255),
    "productCorporation es_ES" varchar(255),
    "productCorporation fr_FR" varchar(255),

    "productDescription de_AT" text,
    "productDescription de_DE" text,
    "productDescription en_US" text,
    "productDescription es_ES" text,
    "productDescription fr_FR" text,


    "articleDescription de_AT" text,
    "articleDescription de_DE" text,
    "articleDescription en_US" text,
    "articleDescription es_ES" text,
    "articleDescription fr_FR" text,


    "articleUnit de_AT" varchar(255),
    "articleUnit de_DE" varchar(255),
    "articleUnit en_US" varchar(255),
    "articleUnit es_ES" varchar(255),
    "articleUnit fr_FR" varchar(255),

    "articleNoticesJson de_AT" text,
    "articleNoticesJson de_DE" text,
    "articleNoticesJson en_US" text,
    "articleNoticesJson es_ES" text,
    "articleNoticesJson fr_FR" text,


    "articlePosText de_AT" varchar(255),
    "articlePosText de_DE" varchar(255),
    "articlePosText en_US" varchar(255),
    "articlePosText es_ES" varchar(255),
    "articlePosText fr_FR" varchar(255),

    "articleTagPaths" text,
    "articleSelectorTags" varchar(255),
    "articleMerchantTags" varchar(255),

    status integer DEFAULT 0,
    notice text DEFAULT '',
    nutrient_unit varchar(10) DEFAULT 'g',

    nutrient_100_energy float DEFAULT null,
    nutrient_100_fat_total float DEFAULT null,
    nutrient_100_fat_saturated float DEFAULT null,
    nutrient_100_protein float DEFAULT null,
    nutrient_100_fibers float DEFAULT null,
    nutrient_100_calcium float DEFAULT null,
    nutrient_100_carb float DEFAULT null,
    nutrient_100_sugar float DEFAULT null,
    nutrient_100_salt float DEFAULT null,
    nutrient_100_lactose float DEFAULT null,
    nutrient_100_natrium float DEFAULT null,
    nutrient_100_bread_unit float DEFAULT null,

    nutrient_snd_amount integer DEFAULT null,
    nutrient_snd_additional varchar(255) DEFAULT '',
    nutrient_snd_additional_de varchar(255) DEFAULT '',

    nutrient_snd_energy float DEFAULT null,
    nutrient_snd_fat_total float DEFAULT null,
    nutrient_snd_fat_saturated float DEFAULT null,
    nutrient_snd_protein float DEFAULT null,
    nutrient_snd_fibers float DEFAULT null,
    nutrient_snd_calcium float DEFAULT null,
    nutrient_snd_carb float DEFAULT null,
    nutrient_snd_sugar float DEFAULT null,
    nutrient_snd_salt float DEFAULT null,
    nutrient_snd_lactose float DEFAULT null,
    nutrient_snd_natrium float DEFAULT null,
    nutrient_snd_bread_unit float DEFAULT null,

    allergen_a boolean DEFAULT false,
    allergen_b boolean DEFAULT false,
    allergen_c boolean DEFAULT false,
    allergen_d boolean DEFAULT false,
    allergen_e boolean DEFAULT false,
    allergen_f boolean DEFAULT false,
    allergen_g boolean DEFAULT false,
    allergen_h boolean DEFAULT false,
    allergen_l boolean DEFAULT false,
    allergen_m boolean DEFAULT false,
    allergen_n boolean DEFAULT false,
    allergen_o boolean DEFAULT false,
    allergen_p boolean DEFAULT false,
    allergen_r boolean DEFAULT false,

    company varchar(255) DEFAULT '',
    origin varchar(3) DEFAULT '',
    store varchar(255) DEFAULT 'normal',
    container varchar(255) DEFAULT '',
    weight_amount float DEFAULT null,
    weight_amount_unit varchar(255) DEFAULT ''

);


CREATE TABLE ingredient (

    id SERIAL PRIMARY KEY,
    name varchar(255) UNIQUE,
    a boolean DEFAULT false,
    b boolean DEFAULT false,
    c boolean DEFAULT false,
    d boolean DEFAULT false,
    e boolean DEFAULT false,
    f boolean DEFAULT false,
    g boolean DEFAULT false,
    h boolean DEFAULT false,
    l boolean DEFAULT false,
    m boolean DEFAULT false,
    n boolean DEFAULT false,
    o boolean DEFAULT false,
    p boolean DEFAULT false,
    r boolean DEFAULT false
);



CREATE TABLE fdata_ingredient (
  fdata_id    int REFERENCES fdata (id) ON UPDATE CASCADE ON DELETE CASCADE
, ingredient_id int REFERENCES ingredient(id) ON UPDATE CASCADE ON DELETE CASCADE
  -- explicit pk
, CONSTRAINT fdata_ingredient_pkey PRIMARY KEY (fdata_id, ingredient_id)
);


CREATE TABLE fdata_ingredient_enthalt (
      fdata_id    int REFERENCES fdata (id) ON UPDATE CASCADE ON DELETE CASCADE
    , ingredient_id int REFERENCES ingredient(id) ON UPDATE CASCADE ON DELETE CASCADE
    -- explicit pk
    , CONSTRAINT fdata_ingredient_enthalt_pkey PRIMARY KEY (fdata_id, ingredient_id)
);

CREATE TABLE fdata_ingredient_gering (
      fdata_id    int REFERENCES fdata (id) ON UPDATE CASCADE ON DELETE CASCADE
    , ingredient_id int REFERENCES ingredient(id) ON UPDATE CASCADE ON DELETE CASCADE
    -- explicit pk
    , CONSTRAINT fdata_ingredient_gering_pkey PRIMARY KEY (fdata_id, ingredient_id)
);


CREATE TABLE category (
    gid integer PRIMARY KEY,
    lvl_1 varchar(255),
    lvl_2 varchar(255),
    lvl_3 varchar(255),
    lvl_4 varchar(255),
    lvl_5 varchar(255),
    lvl_6 varchar(255),
    lvl_7 varchar(255)
);

CREATE TABLE fdata_category (
  fdata_id    int REFERENCES fdata (id) ON UPDATE CASCADE ON DELETE CASCADE
, category_id int REFERENCES category(gid) ON UPDATE CASCADE ON DELETE CASCADE
, CONSTRAINT fdata_category_pkey PRIMARY KEY (fdata_id, category_id)
);


CREATE TABLE taggroup (
    id SERIAL PRIMARY KEY,
    muid varchar(255) UNIQUE,
    name varchar(255)
);

CREATE TABLE tag (
    id SERIAL PRIMARY KEY,
    taggroup int REFERENCES taggroup(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT NULL,
    muid varchar(255) UNIQUE,
    name_de varchar(255),
    name_at varchar(255),
    type VARCHAR(255) /* if type is set, this is a numerical tag */
);


/* saves suggestions for a certain category */
CREATE TABLE category_tag (
  category_id    int REFERENCES category(gid) ON UPDATE CASCADE ON DELETE CASCADE
, tag_id int REFERENCES tag(id) ON UPDATE CASCADE ON DELETE RESTRICT
, CONSTRAINT category_tag_pkey PRIMARY KEY (category_id, tag_id)
);


CREATE TABLE fdata_tag (
      fdata_id int REFERENCES fdata(id) ON UPDATE CASCADE ON DELETE CASCADE
    , tag_id int REFERENCES tag(id) ON UPDATE CASCADE ON DELETE RESTRICT
    , numerical_value float DEFAULT null
    , CONSTRAINT fdata_tag_pkey PRIMARY KEY (fdata_id, tag_id) /* because there is only one constraing possible? */
);

