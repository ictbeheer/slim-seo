( function( document, location ) {
	const tabs = document.querySelectorAll( '.ss-tab' ),
		panes = document.querySelectorAll( '.ss-tab-pane' );

	function clickHandle( e ) {
		if ( !e.target.classList.contains( 'ss-tab' ) ) {
			return;
		}

		e.preventDefault();

		location.hash = e.target.getAttribute( 'href' );

		tabs.forEach( tab => tab.classList.remove( 'ss-is-active' ) );
		e.target.classList.add( 'ss-is-active' );

		panes.forEach( pane => pane.classList.remove( 'ss-is-active' ) );
		document.querySelector( e.target.getAttribute( 'href' ) ).classList.add( 'ss-is-active' );
	}

	function activateFirstTab() {
		const hash = location.hash || '#general';

		document.querySelector( `a[href="${ hash }"]` ).classList.add( 'ss-is-active' );
		document.querySelector( hash ).classList.add( 'ss-is-active' );
	}

	document.querySelector( '.ss-tab-list' ).addEventListener( 'click', clickHandle );

	activateFirstTab();

	tippy( '.ss-tooltip', {
		placement: 'right',
		arrow: true,
		animation: 'fade'
	} );
} )( document, location );
