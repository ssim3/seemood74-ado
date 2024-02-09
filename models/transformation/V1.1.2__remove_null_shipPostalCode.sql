-- Change shipPostalCode to 'A96 Y8C3' where currently set to 'NULL'.
UPDATE RAW_ORDER
SET RAW_ORDER.shipPostalCode = 'A96 Y8C3'
WHERE RAW_ORDER.shipPostalCode = 'NULL'; 