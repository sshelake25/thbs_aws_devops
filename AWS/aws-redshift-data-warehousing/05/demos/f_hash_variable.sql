CREATE OR REPLACE FUNCTION f_hash_variable(element ANYELEMENT)
RETURNS CHAR(32)
IMMUTABLE
AS $$
    import hashlib

    result = hashlib.md5(str(element).encode())
    return result.hexdigest()
$$ LANGUAGE plpythonu;