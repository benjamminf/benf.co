define({

	data: {
		state: 0
	},

	methods: {

		/**
		 *
		 */
		toggle: function()
		{
			this.state = (this.state + 1) % 2;
		},

		/**
		 *
		 */
		open: function()
		{
			this.state = 1;
		},

		/**
		 *
		 */
		close: function()
		{
			this.state = 0;
		},

		/**
		 *
		 * @returns {boolean}
		 */
		isOpen: function()
		{
			return this.state === 1;
		},

		/**
		 *
		 * @returns {boolean}
		 */
		isClosed: function()
		{
			return this.state === 0;
		}
	}
});
