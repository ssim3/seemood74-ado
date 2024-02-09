-- Dropping region columns in tables

-- Dropping Region from CUSTOMER Table
ALTER TABLE RAW_CUSTOMER
DROP COLUMN region;

-- Dropping Region from EMPLOYEE Table
ALTER TABLE RAW_EMPLOYEE
DROP COLUMN Region;

-- Dropping shipRegion from ORDER Table
ALTER TABLE RAW_ORDER
DROP COLUMN shipRegion;