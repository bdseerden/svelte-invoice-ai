alter table "Invoicify"."items"
  add constraint "items_invoice_id_fkey"
  foreign key ("invoice_id")
  references "Invoicify"."invoices"
  ("id") on update restrict on delete cascade;
