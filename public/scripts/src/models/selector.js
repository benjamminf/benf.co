define({

	data: {
		selected: 0,
		total: 0
	},

	computed: {
		interval: {

			get: function()
			{
				return this._interval | 0;
			},

			set: function(v)
			{
				this._interval = v | 0;

				clearInterval(this._intervalId);

				if(this._interval > 0)
				{
					this._intervalId = setInterval(this.next.bind(this), this._interval)
				}
			}
		}
	},

	methods: {

		/**
		 *
		 * @param index
		 */
		select: function(index)
		{
			this.selected = index % this.total;

			if(this.selected < 0)
			{
				this.selected += this.total;
			}
		},

		/**
		 *
		 * @param count
		 */
		go: function(count)
		{
			this.select(this.selected + count);
		},

		/**
		 *
		 */
		next: function()
		{
			this.go(1);
		},

		/**
		 *
		 */
		previous: function()
		{
			this.go(-1);
		},

		/**
		 *
		 * @param index
		 * @returns {boolean}
		 */
		isSelected: function(index)
		{
			return this.selected === index;
		},

		/**
		 *
		 * @returns {boolean}
		 */
		isFirst: function()
		{
			return this.selected === 0;
		},

		/**
		 *
		 * @returns {boolean}
		 */
		isLast: function()
		{
			return this.selected === this.total - 1;
		}
	}
});
