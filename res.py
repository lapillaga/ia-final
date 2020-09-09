self.rule_editor_label = Label(
	root, text="Hechos: ", padx=10, pady=1
)
self.rule_editor_label.grid(
	sticky="W", row=3, column=0, columnspan=2
)




self.new_fact_input = Entry(
	root, width=50
)

self.new_fact_input.grid(
	row=4, column=1, pady=3
)




