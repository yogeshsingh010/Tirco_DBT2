{% macro generate_database_name(custom_db_name, node) -%}
  {%- set env = target.name -%}
  {%- if env == 'dev' and custom_db_name == 'DEV_BRONZE' -%}
    DEV_BRONZE
  {%- elif env == 'prod' and custom_db_name == 'PROD_BRONZE' -%}
    PROD_BRONZE
  {%- else -%}
    {{ custom_db_name }}
  {%- endif -%}
{%- endmacro %}