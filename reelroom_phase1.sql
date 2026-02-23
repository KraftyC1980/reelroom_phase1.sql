-- REELROOM PHASE 1 SETUP

create extension if not exists "uuid-ossp";

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  username text unique,
  display_name text,
  avatar_url text,
  created_at timestamptz default now()
);

alter table public.profiles enable row level security;

create table if not exists public.films (
  id uuid primary key default uuid_generate_v4(),
  title text not null,
  description text,
  video_url text not null,
  thumbnail_url text,
  duration_seconds integer,
  created_at timestamptz default now()
);

alter table public.films enable row level security;
