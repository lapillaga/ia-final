self.rule_editor_label = Label(
	root, text="Hechos: ", padx=10, pady=1
)
self.rule_editor_label.grid(
	sticky="W", row=3, column=0, columnspan=2
)

self.title_facts = Label(
	root, text="Base de hechos y conocimientos: ", padx=10, pady=1
)
self.title_facts.grid(
	sticky="W", row=3, column=2, columnspan=2, pady=3
)

self.new_fact_label = Label(
	root, text='Nuevo hecho: ', padx=10, pady=1
)

self.new_fact_label.grid(
	row=4, column=0, sticky="W"
)

self.new_fact_input = Entry(
	root, width=50
)

self.new_fact_input.grid(
	row=4, column=1, pady=3
)

self.add_new_fact_button = Button(
	root,
	text="Agregar hecho",
	height=1,
	command=self.add_new_fact,
)

self.add_new_fact_button.grid(
	row=4, column=1, padx=5, sticky="E"
)

self.load_two_button = Button(
	root,
	text="Cargar ejercicio 2",
	height=1,
	width=20,
	command=self.load_exercise_two
)

self.load_two_button.grid(
	row=4, column=3, padx=5
)

self.load_five_button = Button(
	root,
	text="Cargar ejercicio 5",
	height=1,
	width=20,
	command=self.load_exercise_five
)

self.load_five_button.grid(
	row=4, column=4, padx=5
)
