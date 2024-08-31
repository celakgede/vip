from agin import *
from importlib import import_module
from agin.modules import ALL_MODULES
for module_name in ALL_MODULES:
        imported_module = import_module("agin.modules." + module_name)
if __name__ == "__main__":
	bot.loop.run_until_complete(sbot())
	aapp.run()
