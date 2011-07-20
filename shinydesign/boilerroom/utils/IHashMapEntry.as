package shinydesign.boilerroom.utils
{
	/**
	 *
	 * <code>IHashMapEntry</code> defines the contract for adding strongly
	 * typed entries to an <code>IMap</code> instance by providing a sealed
	 * type which defines a <code>key</code> and <code>value</code> property.
	 *
	 * @see com.ericfeminella.collections.IMap#putEntry
	 * @see com.ericfeminella.collections.IMap#getEntries
	 *
	 */
	public interface IHashMapEntry
	{
		/**
		 *
		 * Assigns the <code>value</code> of the <code>key</code> property.
		 *
		 * @param <code>value</code> to assign to the <code>key</code> property.
		 *
		 */
		function set key(value:*) : void;
		
		/**
		 *
		 * Retrieves the <code>value</code> of the <code>key</code> property.
		 *
		 * @return <code>value</code> of the <code>key</code> property.
		 *
		 */
		function get key() : *;
		
		/**
		 *
		 * Assigns the <code>value</code> of the <code>value</code> property.
		 *
		 * @param <code>value</code> to assign to the <code>value</code> property.
		 *
		 */
		function set value(value:*) : void;
		
		/**
		 *
		 * Retrieves the <code>value</code> of the <code>value</code> property.
		 *
		 * @return <code>value</code> of the <code>value</code> property.
		 *
		 */
		function get value() : *;
	}
}