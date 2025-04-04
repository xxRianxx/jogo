extends Control


## The timeline to load when starting the scene
export(String, "TimelineDropdown") var timeline: String
export(bool) var add_canvas = true
export(bool) var reset_saves = true

func _ready():
	if reset_saves:
		Dialogic.reset_saves()
	var d = Dialogic.start(timeline, '', "res://addons/dialogic/Nodes/DialogNode.tscn", add_canvas)
	get_parent().call_deferred('add_child', d)
	_copy_signals(d if not add_canvas else d.dialog_node)	
	queue_free()

func _copy_signals(dialogic:Node):
	var sigs = self.get_signal_list()
	for s in sigs:
		if not s['name'] in _signals_to_copy:
			continue
		if not dialogic.has_signal(s['name']):
			print("Cannot copy connections of signal " + s['name'] + " from " + self.to_string() + " to " + dialogic.to_string())
			continue
		var conns = self.get_signal_connection_list(s['name'])
		for c in conns:
			dialogic.connect(c['signal'], c['target'], c['method'], c['binds'], c['flags'])


var _signals_to_copy = [
	'event_start',
	'event_end',
	'text_complete',
	'timeline_start',
	'timeline_end',
	'timeline_changed',
	'dialogic_signal',
	'letter_displayed',
	'auto_advance_toggled',
	'portrait_changed',
]
## -----------------------------------------------------------------------------
## 						SINAIS (cópia dos sinais do DialogNode)
## -----------------------------------------------------------------------------
# Event end/start
signal event_start(type, event)
signal event_end(type)
# Text Signals
signal text_complete(text_data)
# Timeline end/start
signal timeline_start(timeline_name)
signal timeline_end(timeline_name)
signal timeline_changed(old_timeline_name, new_timeline_name)
# Custom user signal
signal dialogic_signal(value)
signal letter_displayed(lastLetter)
signal auto_advance_toggled(toggleValue)
signal portrait_changed(portrait_path)


