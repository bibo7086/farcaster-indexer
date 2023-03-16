create table "public"."reaction" (
    "fid" bigint generated by default as identity not null,
    "target_cast" text not null,
    "target_fid" bigint not null,
    "type" text not null,
    "created_at" timestamp with time zone default now()
);


alter table "public"."reaction" enable row level security;

CREATE UNIQUE INDEX reaction_pkey ON public.reaction USING btree (fid, target_cast);

alter table "public"."reaction" add constraint "reaction_pkey" PRIMARY KEY using index "reaction_pkey";

alter table "public"."reaction" add constraint "reaction_fid_fkey" FOREIGN KEY (fid) REFERENCES profile(id) not valid;

alter table "public"."reaction" validate constraint "reaction_fid_fkey";

alter table "public"."reaction" add constraint "reaction_target_cast_fkey" FOREIGN KEY (target_cast) REFERENCES casts(hash) not valid;

alter table "public"."reaction" validate constraint "reaction_target_cast_fkey";

alter table "public"."reaction" add constraint "reaction_target_fid_fkey" FOREIGN KEY (target_fid) REFERENCES profile(id) not valid;

alter table "public"."reaction" validate constraint "reaction_target_fid_fkey";

