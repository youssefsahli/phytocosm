import openfoodfacts
import orjson
import pprint

api = openfoodfacts.API(user_agent="YS/1.0")
a = api.product.text_search("avene")
print(type(a))
print(orjson.dumps(orjson.loads(a), option=orjson.OPT_INDENT_2))
