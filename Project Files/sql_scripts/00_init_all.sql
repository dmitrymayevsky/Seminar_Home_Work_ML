-- Таблица wells (скважины)
CREATE TABLE IF NOT EXISTS wells (
    well_id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    field_name VARCHAR(100),
    region VARCHAR(100),
    start_date DATE,
    operator VARCHAR(100),
    status VARCHAR(50)
);

-- Таблица production (добыча)
CREATE TABLE IF NOT EXISTS production (
    well_id INTEGER,
    date DATE,
    oil_ton DECIMAL(10,2),
    gas_m3 DECIMAL(10,2),
    water_m3 DECIMAL(10,2),
    energy_kwh DECIMAL(10,2),
    downtime_hours DECIMAL(5,2),
    temperature DECIMAL(6,2),
    pressure DECIMAL(8,2)
);

-- Таблица well_telemetry (телеметрия)
CREATE TABLE IF NOT EXISTS well_telemetry (
    well_id INTEGER,
    timestamp TIMESTAMP,
    pump_speed_rpm INTEGER,
    pump_current DECIMAL(8,2),
    pressure_in DECIMAL(8,2),
    pressure_out DECIMAL(8,2),
    temperature DECIMAL(6,2),
    vibration DECIMAL(5,2),
    oil_flow_rate DECIMAL(8,2)
);

-- Таблица pumps (насосы)
CREATE TABLE IF NOT EXISTS pumps (
    pump_id INTEGER PRIMARY KEY,
    well_id INTEGER,
    type VARCHAR(50),
    install_date DATE,
    manufacturer VARCHAR(50),
    model VARCHAR(50)
);

-- Таблица pump_sensors (датчики насосов)
CREATE TABLE IF NOT EXISTS pump_sensors (
    pump_id INTEGER,
    timestamp TIMESTAMP,
    temperature DECIMAL(6,2),
    vibration DECIMAL(5,2),
    current DECIMAL(8,2),
    rpm INTEGER,
    pressure DECIMAL(8,2)
);

-- Таблица drivers (водители)
CREATE TABLE IF NOT EXISTS drivers (
    driver_id INTEGER PRIMARY KEY,
    name VARCHAR(100),
    experience_years INTEGER,
    region VARCHAR(100)
);

-- Таблица vehicles (транспорт)
CREATE TABLE IF NOT EXISTS vehicles (
    vehicle_id INTEGER PRIMARY KEY,
    plate_number VARCHAR(20),
    capacity_ton DECIMAL(8,2),
    fuel_type VARCHAR(20)
);

-- Таблица deliveries (поставки)
CREATE TABLE IF NOT EXISTS deliveries (
    date DATE,
    source VARCHAR(100),
    destination VARCHAR(100),
    product_type VARCHAR(50),
    volume_ton DECIMAL(10,2),
    cost_usd DECIMAL(10,2),
    delay_hours DECIMAL(5,2),
    distance_km DECIMAL(8,2),
    weather_conditions VARCHAR(50),
    driver_id INTEGER,
    vehicle_id INTEGER
);
