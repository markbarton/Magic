package shinydesign.boilerroom.utils
{
	/**
	 *
	 * <code>HashMapEntry</code> provides a strongly typed object with which
	 * objects can reference a <code>key</code> and <code>value</code> property.
	 *
	 * @see com.ericfeminella.collections.IHashMapEntry
	 * @see com.ericfeminella.collections.IMap#putEntry
	 * @see com.ericfeminella.collections.IMap#getEntries
	 *
	 */
	public class HashMapEntry implements IHashMapEntry
	{
		/**
		 *
		 * Defines the reference to the <code>key</code> which is to
		 * be used as the <code>key</code> in an <code>IMap</code>
		 * implementation.
		 *
		 */
		protected var _key:* = undefined;
		
		/**
		 *
		 * Defines the reference to the <code>value</code> which is to
		 * be used as the <code>value</code> in an <code>IMap</code>
		 * implementation.
		 *
		 */
		protected var _value:* = undefined;
		
		/**
		 *
		 * The <code>HashMapEntry</code> constructor requires the <code>key</code>
		 * and <code>value</code> which is assigned to the <code>key</code>. The
		 * <code>key</code> and <code>value</code> equate to the <code>key</code>
		 * and <code>value</code> of an <code>IMap</code> entry.
		 *
		 */
		public function HashMapEntry(key:* = undefined, value:* = undefined)
		{
			_key   = key;
			_value = value;
		}
		
		/**
		 *
		 * @inheritDoc
		 *
		 */
		public function get key() : *
		{
			return _key;
		}
		
		/**
		 *
		 * @inheritDoc
		 *
		 */
		public function set key(key:*) : void
		{
			_key = key;
		}
		
		/**
		 *
		 * @inheritDoc
		 *
		 */
		public function get value() : *
		{
			return _value;
		}
		
		/**
		 *
		 * @inheritDoc
		 *
		 */
		public function set value(value:*) : void
		{
			_value = value;
		}
	}
}