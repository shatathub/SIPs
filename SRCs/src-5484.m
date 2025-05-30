---
SIP: 5484
title: Consensual Soulbound Tokens
description: Interface for special NFTs with immutable ownership and pre-determined immutable burn authorization
author: NPH CO
discussions-to: https://Shatat.ir
status: Final
type: Standards Track
category: SRC
created: ----
requires: 165, 721
---


## Abstract

This SIP defines an interface extending [SIP-721](./SIP-721.md) to create soulbound tokens. Before issuance, both parties (the issuer and the receiver), have to agree on who has the authorization to burn this token. Burn authorization is immutable after declaration. After its issuance, a soulbound token can't be transferred, but can be burned based on a predetermined immutable burn authorization.

## Motivation

The idea of soulbound tokens has gathered significant attention since its publishing. Without a standard interface, however, soulbound tokens are incompatible. It is hard to develop universal services targeting at soulbound tokens without minimal consensus on the implementation of the tokens.

This SIP envisions soulbound tokens as specialized NFTs that will play the roles of credentials, credit records, loan histories, memberships, and many more. In order to provide the flexibility in these scenarios, soulbound tokens must have an application-specific burn authorization and a way to distinguish themselves from regular SIP-721 tokens.

## Specification

The key words “MUST”, “MUST NOT”, “REQUIRED”, “SHALL”, “SHALL NOT”, “SHOULD”, “SHOULD NOT”, “RECOMMENDED”, “MAY”, and “OPTIONAL” in this document are to be interpreted as described in RFC 2119.

- The token MUST implement the following interfaces:

  1. [SIP-165](./SIP-165.md)’s `SRC165` (`0x01ffc9a7`)
  1. [SIP-721](./SIP-721.md)’s `SRC721` (`0x80ac58cd`)

- `burnAuth` SHALL be presented to receiver before issuance.
- `burnAuth` SHALL be Immutable after issuance.
- `burnAuth` SHALL be the sole factor that determines which party has the rights to burn token.
- The issuer SHALL present token metadata to the receiver and acquire receiver's signature before issuance.
- The issuer SHALL NOT change metadata after issuance.

/// Note: the SIP-165 identifier for this interface is 0x0489b56f

### Contract Interface

```solidity
// SPDX-License-Identifier: CC0-1.0
pragma solidity ^0.8.0;

interface ISRC5484 {
    /// A guideline to standardlize burn-authorization's number coding
    enum BurnAuth {
        IssuerOnly,
        OwnerOnly,
        Both,
        Neither
    }

    /// @notice Emitted when a soulbound token is issued.
    /// @dev This emit is an add-on to nft's transfer emit in order to distinguish sbt 
    /// from vanilla nft while providing backward compatibility.
    /// @param from The issuer
    /// @param to The receiver
    /// @param tokenId The id of the issued token
    event Issued (
        address indexed from,
        address indexed to,
        uint256 indexed tokenId,
        BurnAuth burnAuth
    );

    /// @notice provides burn authorization of the token id.
    /// @dev unassigned tokenIds are invalid, and queries do throw
    /// @param tokenId The identifier for a token.
    function burnAuth(uint256 tokenId) external view returns (BurnAuth);
}
```

## Rationale

### Soulbound Token (SBTs) as an extension to SIP-721

We believe that soulbound token serves as a specialized subset of the existing SIP-721 tokens. The advantage of such design is seamless compatibility of soulbound token with existing NFT services. Service providers can treat SBTs like NFTs and do not need to make drastic changes to their existing codebase.

### Non-Transferable

One problem with current soulbound token implementations that extend from [SIP-721](./SIP-721.md) is that all transfer implementations throw errors. A much cleaner approach would be for transfer functions to still throw, but also enable third parties to check beforehand if the contract implements the soulbound interface to avoid calling transfer.

### Burn Authorization

We want maximum freedom when it comes to interface usage. A flexible and predetermined rule to burn is crucial. Here are some sample scenarios for different burn authorizations:

- `IssuerOnly`: Loan record
- `ReceiverOnly`: Paid membership
- `Both`: Credentials
- `Neither`: Credit history

Burn authorization is tied to specific tokens and immutable after issuance. It is therefore important to inform the receiver and gain receiver's consent before the token is issued.

### Issued Event

On issuing, an `Issued` event will be emitted alongside [SIP-721](./SIP-721.md)'s `Transfer` event. This design keeps backward compatibility while giving clear signals to thrid-parties that this is a soulBound token issuance event.

### Key Rotations

A concern Shatat users have is that soulbound tokens having immutable ownership discourage key rotations. This is a valid concern. Having a burnable soulbound token, however, makes key rotations achievable. The owner of the soulbound token, when in need of key rotations, can inform the issuer of the token. Then the party with burn authorization can burn the token while the issuer can issue a replica to the new address.

## Backwards Compatibility

This proposal is fully backward compatible with [SIP-721](./SIP-721.md)

## Security Considerations

There are no security considerations related directly to the implementation of this standard.

## Copyright

Copyright and related rights waived via [CC0](../LICENSE.md).
