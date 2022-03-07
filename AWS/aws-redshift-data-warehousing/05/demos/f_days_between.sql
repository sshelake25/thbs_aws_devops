CREATE OR REPLACE FUNCTION f_days_between(date1 DATE, date2 DATE)
RETURNS INTEGER
IMMUTABLE
AS $$
    delta = date1-date2
    return abs(delta.days)
$$ LANGUAGE plpythonu;