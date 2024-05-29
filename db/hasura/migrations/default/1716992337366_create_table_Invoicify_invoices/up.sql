CREATE TABLE "Invoicify"."invoices" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "client_id" uuid NOT NULL, "date" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("client_id") REFERENCES "Invoicify"."clients"("id") ON UPDATE restrict ON DELETE cascade, UNIQUE ("id"));
CREATE EXTENSION IF NOT EXISTS pgcrypto;
