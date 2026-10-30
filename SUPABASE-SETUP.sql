-- Run this in Supabase SQL Editor. Vault payloads are encrypted in the browser before upload.
create table if not exists public.encrypted_vaults (
  user_id uuid primary key references auth.users(id) on delete cascade,
  vault jsonb not null,
  salt jsonb not null,
  updated_at timestamptz not null default now()
);
alter table public.encrypted_vaults enable row level security;
drop policy if exists "Users can read their own encrypted vault" on public.encrypted_vaults;
create policy "Users can read their own encrypted vault" on public.encrypted_vaults
  for select to authenticated using (auth.uid() = user_id);
drop policy if exists "Users can insert their own encrypted vault" on public.encrypted_vaults;
create policy "Users can insert their own encrypted vault" on public.encrypted_vaults
  for insert to authenticated with check (auth.uid() = user_id);
drop policy if exists "Users can update their own encrypted vault" on public.encrypted_vaults;
create policy "Users can update their own encrypted vault" on public.encrypted_vaults
  for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
