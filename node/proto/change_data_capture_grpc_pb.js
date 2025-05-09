// GENERATED CODE -- DO NOT EDIT!

'use strict';
var grpc = require('@grpc/grpc-js');
var change_data_capture_pb = require('./change_data_capture_pb.js');

function serialize_litetable_cdc_v1_CDCEvent(arg) {
  if (!(arg instanceof change_data_capture_pb.CDCEvent)) {
    throw new Error('Expected argument of type litetable.cdc.v1.CDCEvent');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_litetable_cdc_v1_CDCEvent(buffer_arg) {
  return change_data_capture_pb.CDCEvent.deserializeBinary(new Uint8Array(buffer_arg));
}

function serialize_litetable_cdc_v1_CDCSubscriptionRequest(arg) {
  if (!(arg instanceof change_data_capture_pb.CDCSubscriptionRequest)) {
    throw new Error('Expected argument of type litetable.cdc.v1.CDCSubscriptionRequest');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_litetable_cdc_v1_CDCSubscriptionRequest(buffer_arg) {
  return change_data_capture_pb.CDCSubscriptionRequest.deserializeBinary(new Uint8Array(buffer_arg));
}


// CDCService is a streaming gRPC service that receives a CDC event.
var CDCServiceService = exports.CDCServiceService = {
  cDCStream: {
    path: '/litetable.cdc.v1.CDCService/CDCStream',
    requestStream: false,
    responseStream: true,
    requestType: change_data_capture_pb.CDCSubscriptionRequest,
    responseType: change_data_capture_pb.CDCEvent,
    requestSerialize: serialize_litetable_cdc_v1_CDCSubscriptionRequest,
    requestDeserialize: deserialize_litetable_cdc_v1_CDCSubscriptionRequest,
    responseSerialize: serialize_litetable_cdc_v1_CDCEvent,
    responseDeserialize: deserialize_litetable_cdc_v1_CDCEvent,
  },
};

exports.CDCServiceClient = grpc.makeGenericClientConstructor(CDCServiceService, 'CDCService');
