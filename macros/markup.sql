{% macro markup(sellingprice, costprice) %}
({{sellingprice}} - {{costprice}})/{{costprice}}
{% endmacro %}