import { LightningElement, api } from 'lwc';

export default class StatusBadge extends LightningElement {

    @api status;


    // ============================================================
    // STATUS LABEL
    // ============================================================

    get statusLabel() {

        return this.status || 'Unknown';
    }


    // ============================================================
    // STATUS TYPE
    // ============================================================

    get isApplied() {

        return this.status === 'Applied';
    }


    get isPending() {

        return this.status === 'Pending';
    }


    get isSelected() {

        return this.status === 'Selected';
    }


    get isRejected() {

        return this.status === 'Rejected';
    }


    // ============================================================
    // STATUS CLASS
    // ============================================================

    get badgeClass() {

        if (this.isSelected) {

            return 'slds-badge slds-theme_success';
        }

        if (this.isRejected) {

            return 'slds-badge slds-theme_error';
        }

        if (this.isPending) {

            return 'slds-badge slds-theme_warning';
        }

        if (this.isApplied) {

            return 'slds-badge slds-theme_info';
        }

        return 'slds-badge';
    }
}
