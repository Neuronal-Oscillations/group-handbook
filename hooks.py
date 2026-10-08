def on_nav(nav, **kwargs):
    _rename(nav.items)

def _rename(items):
    for item in items:
        if item.title:
            item.title = item.title.replace("-", " ")
        if hasattr(item, "children") and item.children:
            _rename(item.children)
